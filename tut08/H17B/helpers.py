# helper functions

# returns true if subject exists in db
def subjectExists(conn, subj):
	cur = conn.cursor()
	cur.execute("select * from subjects where code = %s", [subj])

	result = cur.fetchone()
	return result is not None

# returns true if term exists in db
def termExists(conn, term):
	cur = conn.cursor()
	cur.execute("select * from terms where code = %s", [term])

	result = cur.fetchone()
	return result is not None

# returns true if student exists in db
def studentExists(conn, id):
	cur = conn.cursor()
	cur.execute("select * from students where id = %s", [id])

	result = cur.fetchone()
	return result is not None

# returns subject name if course exists in db
def getSubjectName(conn, subj, term):
	cur = conn.cursor()

	query = """
		select s.name
		from courses c
		join subjects s on (s.id = c.subject)
		join terms t on (t.id = c.term)
		where s.code = %s and t.code = %s
	"""
	cur.execute(query, [subj, term])

	return cur.fetchone()