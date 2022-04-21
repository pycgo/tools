from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    with open('Dockerfile','r') as f:
        for line in f:
            if "dnf install" in line:
                toolslist = line.split(' ')
    data_list = toolslist[3:][:-4]
    meta_linux = "1、已经安装的工具列表如下：\n"
    str_tools = meta_linux + '\n'.join(data_list)

    meta_python3 = "\n\n\n2、python3.8的第三方库如下：\n"
    pip_list = []
    with open('requirements.txt','r') as f:
        for line in f:
            pip_list.append(line)
    str_tools = str_tools + meta_python3 + ''.join(pip_list)
    print(str_tools)

    return str_tools

index()

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80, debug=False)
