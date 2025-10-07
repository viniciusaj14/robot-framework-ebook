# Makefile - Automação Robot Framework

.PHONY: setup test clean

# Cria ambiente virtual e instala dependências
setup:
	python3 -m venv .venv
	. .venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt && rfbrowser init || true

# Executa os testes e gera relatórios em results/
test:
	. .venv/bin/activate && robot -d results tests/

# Remove diretório de resultados e ambiente virtual
clean:
	rm -rf results .venv
