# 🌡 Weather-shell
- Compact bash script that prints the weather forecast of your current location.

## 👨🏼‍💻 Download
- To download the program, clone the project with HTTPS

```git clone https://github.com/haakohsk/weather-shell.git```

## 📌 Dependencies
- [Positionstack](https://positionstack.com/signup/free) generate a free, private API key. Set it to the variable _positionstack_api_key_.
- [JQ](https://github.com/stedolan/jq) command-line JSON processor
- Install with brew: 
```brew install jq```

## 🏃🏽‍♂️ Run script
- Give the program execution permissions
```chmod +x /path/to/script/./weather-shell.sh```

## 🤖 Make script run for every new shell
- Paste the following into ~/.bashrc:
```~/path/to/script/./weather-shell.sh "YOUR_CITY"```
- Note if you are using another shell, for instance oh my zsh, the file would be ~/.zshrc
