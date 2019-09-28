function checkup

  echo \n"Ready? 🍻"\n

  echo "▶️  Check npm update"\n
  ncu -g
  echo "▶️  Check gem update"\n
  gem outdated
  echo "▶️  Check python 2 update"\n
  python2 -m pip list --outdated
  echo "▶️  Check python 3 update"\n
  python3 -m pip list --outdated
  echo "▶️  Check composer update"\n
  composer global outdated
  echo "▶️  Check Mac App Store update"\n
  mas outdated
  echo "▶️  Check default config"\n
  # macOS
  for file in (find /usr/local -name "*.default")
    set defaultFile (echo $file | sed 's/.default//')
    diff "$file" "$defaultFile" > /dev/null
    if test $status -eq 1
      echo "diff : $defaultFile"
    else
      echo "nodiff : $defaultFile"
    end
  end
  # Arch Linux
  # find / -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null

  echo \n"Finished! 🎉"\n

end
