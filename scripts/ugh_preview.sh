repo_path="$1"
echo -e "\033[1;34mFull path:\033[0m $repo_path"
echo -e "\033[1;32mProject name:\033[0m $(echo "$repo_path" | sed "s|.*/||")"
printf "\n\033[1;33mStats:\033[0m\n"

if [ -d "$repo_path/.git" ]; then
  printf "\033[1;36mLast commit:\033[0m $(git -C "$repo_path" log -1 --pretty=format:'%h - %an, %ar : %s')\n"
  printf "\033[1;36mNumber of commits:\033[0m $(git -C "$repo_path" rev-list --count HEAD)\n"
  printf "\033[1;36mBranches:\033[0m $(git -C "$repo_path" branch | wc -l)\n"
else
  printf "\033[1;31mNot a git repository\033[0m\n"
fi
