from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    with open('Dockerfile','r') as f:
        for line in f:
            if "dnf install" in line:
                toolslist = line.split(' ')
    data_list = toolslist[3:][:-4]
    meta = "已经安装的工具列表如下：\n"
    str_tools = meta + '\n'.join(data_list)
    print(str_tools)
    return str_tools

index()

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80, debug=False)

