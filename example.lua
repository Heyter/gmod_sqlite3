if not sqlite3 then
	require("sqlite3")
end

if sqlite3 then
	local myDB=sqlite3.open('garrysmod/sv.sqlite3')
	myDB:exec[[
	  CREATE TABLE items (
		id INTEGER PRIMARY KEY,
		itemId INTEGER,
		countItems INTEGER
	  );
	]]
	for row in myDB:rows("insert into items (itemId,countItems) values (100, 300), (100, 300), (100, 300) returning id, itemId") do
		PrintTable(row)
	end
	myDB:close()
end