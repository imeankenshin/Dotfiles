# Description: Bootstrap script for dotfiles

if [ -z $DOTFILES_PATH ]; then
  echo "Error: DOTFILES_PATH is not set. Please set the DOTFILES_PATH environment variable."
  exit 1
fi

if ! command -v zinit &> /dev/null; then
  echo "📦 Installing zinit..." 
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

for f in $DOTFILES_PATH/root/.*; do
  if [ -f $f ]; then
    ln -sf $f $HOME/$(basename $f)
  fi
done

mkdir -p $HOME/.config

for f in $DOTFILES_PATH/config/**/**; do
  if [ -f $f ]; then
    echo "🔗 Linking $f to ~/.config/$(dirname $(sed "s|$DOTFILES_PATH/config/||g" <<< $f))..."
    mkdir -p $HOME/.config/$(dirname $(sed "s|$DOTFILES_PATH/config/||g" <<< $f))
    ln -sf $f $HOME/.config/$(sed "s|$DOTFILES_PATH/config/||g" <<< $f)
  fi
done

