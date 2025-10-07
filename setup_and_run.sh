#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------
# Automação de setup e execução - Robot Framework
# Uso:
#   chmod +x setup_and_run.sh
#   ./setup_and_run.sh
# ---------------------------------------------

# Detecta diretório do script e vai para a raiz do projeto
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PROJECT_ROOT="$SCRIPT_DIR"
RESULTS_DIR="$PROJECT_ROOT/results"
PYTHON_BIN="python3"

echo "[1/6] Criando ambiente virtual (.venv)..."
if [ ! -d .venv ]; then
  "$PYTHON_BIN" -m venv .venv
fi

# Ativa venv
if [ -f ".venv/bin/activate" ]; then
  source .venv/bin/activate
elif [ -f ".venv/Scripts/activate" ]; then
  # Caso Windows com Git Bash
  source .venv/Scripts/activate
fi

echo "[2/6] Atualizando pip..."
python -m pip install --upgrade pip

echo "[3/6] Instalando dependências (requirements.txt)..."
if [ -f requirements.txt ]; then
  pip install -r requirements.txt
else
  echo "Arquivo requirements.txt não encontrado!"
  exit 1
fi

# Inicializa o Browser (Playwright) se disponível
echo "[4/6] Inicializando Browser (Playwright) se aplicável..."
if command -v rfbrowser >/dev/null 2>&1; then
  rfbrowser init || true
else
  echo "rfbrowser não encontrado (ok se não for usar Browser library)."
fi

# Garante diretório de resultados
mkdir -p "$RESULTS_DIR"

echo "[5/6] Executando testes Robot..."
robot -d "$RESULTS_DIR" tests/

echo "[6/6] Abrindo relatório (se suportado)..."
REPORT_HTML="$RESULTS_DIR/report.html"
LOG_HTML="$RESULTS_DIR/log.html"

if [ -f "$REPORT_HTML" ]; then
  if command -v open >/dev/null 2>&1; then
    open "$REPORT_HTML"
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$REPORT_HTML"
  else
    echo "Abra manualmente: $REPORT_HTML"
  fi
else
  echo "Relatório não encontrado em $REPORT_HTML"
fi

echo "Concluído com sucesso."
