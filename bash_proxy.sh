PROXY_PORT=7890
proxy() {
        if [ -z "$http_proxy" ] && [ -z "$https_proxy" ] && [ -z "$all_proxy" ]; then
                export http_proxy=http://127.0.0.1:${PROXY_PORT}
                export https_proxy=http://127.0.0.1:${PROXY_PORT}
                export all_proxy=socks5://127.0.0.1:${PROXY_PORT}
                echo "Proxy has been set to port ${PROXY_PORT}."
        else
                unset http_proxy
                unset https_proxy
                unset all_proxy
                echo "Proxy has been unset."
        fi
}

function venv() {
        if [ -z "$1" ]; then
                echo "Error"
                return 1
        fi
        source ~/.pyEnv/"$1"/bin/activate
}
