#!/bin/sh
git config --global core.excludesfile "$HOME/.gitignore_global"

cat > "$HOME/.gitignore_global" <<'EOF'
.DS_Store
Thumbs.db
desktop.ini
*~
*.swp
*.swo
EOF
