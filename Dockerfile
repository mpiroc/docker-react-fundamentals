FROM node
MAINTAINER Matthew Pirocchi <matthew.pirocchi@gmail.com>

RUN useradd -m ec2-user

# Install vim
RUN apt-get update && apt-get install -y vim
RUN su ec2-user -c 'echo "set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab" >> ~/.vimrc'

# Install Pathogen (vim module loader)
RUN su ec2-user -c 'mkdir -p ~/.vim/autoload ~/.vim/bundle'
RUN su ec2-user -c 'curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim'

RUN su ec2-user -c 'echo "execute pathogen#infect()" >> ~/.vimrc'
RUN su ec2-user -c 'echo "syntax on" >> ~/.vimrc'
RUN su ec2-user -c 'echo "filetype plugin indent on" >> ~/.vimrc'

# Install vim-jsx (JSX syntax highlighting)
RUN su ec2-user -c 'git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jx'
RUN su ec2-user -c 'echo "let g:jsx_ext_required = 0" >> ~/.vimrc'

EXPOSE 8080
