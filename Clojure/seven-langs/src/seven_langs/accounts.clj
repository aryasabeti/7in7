;; Day 3

; Use refs to create a vector of accounts in memory. 
; Create debit and credit functions to change the balance of an account

(defprotocol AccountTransaction
	"For debiting and crediting"
	(credit [this amt] "credit")
	(debit [this amt] "debit")
	(balance [this] "balance"))

(defrecord Account [fname lname account-id cur-balance]
	AccountTransaction
	(credit [this amt] (update-in this [:cur-balance] + amt))
	(debit [this amt] (update-in this [:cur-balance] - amt))
	(balance [this] cur-balance))

(def account-list [])

(defn add-account
	"Given (Account |or| customer data), adds new account.
	Returns account-list"
	([new-account]
		(cond 
			(instance? Account new-account)
				(def account-list (conj account-list (ref new-account))))
		account-list)
	([fname lname account-id balance]
		(add-account
			(Account. fname lname account-id balance))))
