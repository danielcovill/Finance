DROP TABLE IF EXISTS budgets;
CREATE TABLE budgets (
	id INTEGER PRIMARY KEY ASC,
	name TEXT,
	note TEXT
) STRICT;

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
	id INTEGER PRIMARY KEY ASC,
	account_id INTEGER, --if transfer, else null
	payee_id INTEGER,
	transaction_label_id INTEGER,
	inflow REAL,
	outflow REAL,
	is_cleared INTEGER,
	is_reconciled INTEGER,
	note TEXT,
	FOREIGN KEY (account_id) REFERENCES accounts(id),
	FOREIGN KEY (payee_id) REFERENCES payees(id),
	FOREIGN KEY (transaction_label_id) REFERENCES transaction_labels(id)
) STRICT;

DROP TABLE IF EXISTS transaction_splits;
CREATE TABLE transaction_splits (
	id INTEGER PRIMARY KEY ASC,
	transaction_id INTEGER,
	category_id INTEGER,
	transaction_label_id INTEGER,
	inflow REAL,
	outflow REAL,
	note TEXT,
	FOREIGN KEY (transaction_id) REFERENCES transactions(id),
	FOREIGN KEY (category_id) REFERENCES categories(id),
	FOREIGN KEY (transaction_label_id) REFERENCES transaction_labels(id)
) STRICT;

DROP TABLE IF EXISTS payees;
CREATE TABLE payees (
	id INTEGER PRIMARY KEY ASC,
	name TEXT,
	account_id INTEGER,
	note TEXT,
	FOREIGN KEY (account_id) REFERENCES accounts(id)
) STRICT;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	id INTEGER PRIMARY KEY ASC,
	name TEXT,
	parent_category INTEGER,
	note TEXT,
	FOREIGN KEY (parent_category) REFERENCES categories(id)
) STRICT;

DROP TABLE IF EXISTS transaction_labels;
CREATE TABLE transaction_labels (
	id INTEGER PRIMARY KEY ASC,
	name TEXT NOT NULL
) STRICT;

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id INTEGER PRIMARY KEY ASC,
	name TEXT,
	is_budget_account INTEGER,
	is_closed INTEGER,
	note TEXT
) STRICT;
 
DROP TABLE IF EXISTS field_history;
CREATE TABLE field_history (
	id INTEGER PRIMARY KEY ASC,
	updated_table TEXT NOT NULL,
	row_id INTEGER NOT NULL,
	value_from TEXT,
	value_to TEXT,
	updated INTEGER NOT NULL DEFAULT (unixepoch())
) STRICT;