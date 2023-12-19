# Description: Bootstrap script for dotfiles

if [ -z $DOTFILES_PATH ]; then
  echo "Error: DOTFILES_PATH is not set. Please set the DOTFILES_PATH environment variable."
  exit 1
fi

for f in $DOTFILES_PATH/root/.*; do
  if [ -f $f ]; then
    echo "$f <- $HOME/$(basename $f)"
    ln -sf $f $HOME/$(basename $f)
  fi
done

for f in $DOTFILES_PATH/config/**/**; do
  if [ -f $f ]; then
    echo "$f <- $HOME/.config/$(sed "s|$DOTFILES_PATH/config/||g" <<< $f)"
    mkdir -p $HOME/.config/$(dirname $(sed "s|$DOTFILES_PATH/config/||g" <<< $f))
    ln -sf $f $HOME/.config/$(sed "s|$DOTFILES_PATH/config/||g" <<< $f)
  fi
done
