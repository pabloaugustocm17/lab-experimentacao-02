var = ()
diretorio_repo = ./diretorio-repo/ 

for i in {1.1000}; do 
	git clone ${var[$i]} ${diretorio_repo}
	git pull 
	python script.py
	rmdir ${diretorio_repo}
done
