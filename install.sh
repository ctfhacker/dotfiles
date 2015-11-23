rm ../.bashrc
for d in $(ls); do stow $d; done
