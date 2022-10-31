import mysql.connector

outfile = open("delete.txt",'w')
databases = ['dv','library']
for database in databases:

    cnx = mysql.connector.connect(user='root', password='123456',
                   host='172.16.86.128',
                   database=database)

    cursor = cnx.cursor()
    query = ("SELECT concat('DROP TABLE IF EXISTS ', table_name, ';') FROM information_schema.tables WHERE table_schema = '" + database + "';")

    cursor.execute(query)

    for i in cursor:
        tmp_str = i[0].split(' ')
        tmp_str[4] = database + "." + tmp_str[4]
        print(tmp_str)
        outfile.write(' '.join(tmp_str) + '\n')
    cursor.close()
    cnx.close()
outfile.close()
