# helper functions

# returns true if subject exists in db
def subjectExists(conn, subject):
	cur = conn.cursor()
	cur.execute("select * from subjects where code = %s", [subject])

	result = cur.fetchone()
	return result is not None

# returns true if term exists in db
def termExists(conn, term):
	cur = conn.cursor()
	cur.execute("select * from terms where code = %s", [term])

	result = cur.fetchone()
	return result is not None

# returns true if student exists in db
def studentExists(conn, studentID):
	cur = conn.cursor()
	cur.execute("select * from students where id = %s", [studentID])

	result = cur.fetchone()
	return result is not None

# returns subject name if course offering exists in db
# otherwise returns None
def getCourseName(conn, subject, term):
	cur = conn.cursor()

	query = """
	select s.name
	from courses c
	join subjects s on (c.subject = s.id)
	join terms t on (c.term = t.id)
	where s.code = %s and t.code = %s
	"""

	cur.execute(query, [subject, term])
	return cur.fetchone()


	