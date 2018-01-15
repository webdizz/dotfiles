#!/bin/sh
# Install all VSCode extensions from given string

for ext in 'christian-kohler.path-intellisense' \
            'PeterJausovec.vscode-docker' \
            'codezombiech.gitignore' \
            'donjayamanne.python' \
            'HookyQR.beautify' \
            'lukehoban.go' \
            'redhat.java' \
            'EditorConfig.editorconfig' \
            'formulahendry.auto-close-tag' \
            'DotJoshJohnson.xml' \
            'humao.rest-client' \
            'streetsidesoftware.code-spell-checker' \
            'rebornix.ruby' \
            'k--kato.intellij-idea-keybindings' \
            'gerane.theme-solarized-light' \
            'gerane.theme-solarized-dark' \
            'vscjava.vscode-java-pack' \
            'sensourceinc.vscode-sql-beautify' \
            'xyz.plsql-language' \
            'donjayamanne.jupyter' \
            'mathiasfrohlich.kotlin' \
            'formulahendry.terminal' \; do
    code  --install-extension "$ext"
done