Você aprende os comandos uteis do Git/GitHub

git init -> inicializa um repositório git

git config --global user.email "you@example.com"

git config --global user.name "Your Name"

git log -> mostra as versões que já tiveram commit e seus detalhes

git status -> mostra como estão seu working directory, stage area e repository

git diff -> sem argumentos, compara o working directory com a stage area

git diff --staged -> compara a stage area com o repository

git diff id1 id2 -> compara dois commits diferentes

git add file -> adiciona um arquivo modificado na working area para a stage area

git commit -> faz o commit de tudo que está na stage area

git log --graph --oneline -> apresenta os logs em forma de grafo

git branch -> mostra os branches do seu projeto

git branch xxx -> cria um novo branch

git checkout xxx -> vai para o branch desejado, ou se utilizar um id de commit, cria um branch sem head

git merge master changes -> realiza um merge de changes para o master

git clone https://github.com/romero/recipes.git -> cria um clone do repositorio do git hub localmente

git push origin master -> passa o conteudo do master local para a origem no github

git pull origin master -> passa o conteudo online para o master local

git fetch -> puxa as atualizações realizadas no repositiorio online (Sem fazer o merge)

git remote add upstream https://... -> adiciona um repositorio original do fork

git rebase upstream/master --> fast-foward do projeto para o master do repositorio original do fork
