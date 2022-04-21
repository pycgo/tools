from pyignite import Client

test_table = 'test'
test_insert_query = '''INSERT INTO test(Code, Name) VALUES (?, ?)'''

test_create_table = '''CREATE TABLE test (
    Code CHAR(10) PRIMARY KEY,
    Name CHAR(52),
)'''

test_data = [
    [
        'UTT', 'United States',
    ],
    [
        'CHA', 'CHINA',
    ],
]

client = Client()
with client.connect('172.16.86.128', 10800):
    #建表
    # for query in [
    #     test_create_table,
    # ]:
    #     client.sql(query)

    #插入数据
    # for row in test_data:
    #     client.sql(test_insert_query, query_args=row)

    #查询数据
    SQL = '''select * from test'''

    with client.sql(SQL) as cursor:
        print('data:')
        for row in cursor:
            print(row)
