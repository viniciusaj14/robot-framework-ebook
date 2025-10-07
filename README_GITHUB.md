# 🤖 Automatize com Precisão: Guia Prático de Automação de Testes com Robot Framework

Projeto completo para quem deseja aprender e aplicar **automação de testes** com o **Robot Framework**, incluindo:
- 📘 Ebook completo  
- 📊 Slides ilustrados  
- 🧰 Scripts de automação  
- ⚙️ CI/CD configurado  
- 📦 Estrutura de testes pronta para execução

---

## 🚀 Começando

Clone este repositório:
```bash
git clone https://github.com/viniciusaj14/robot-framework-ebook.git
cd robot-framework-ebook
```

---

## ⚙️ Opção 1 – Instalação e execução automática via script

Use o script Bash para configurar e rodar tudo automaticamente:

```bash
chmod +x setup_and_run.sh
./setup_and_run.sh
```

Ele irá:
1. Criar o ambiente virtual `.venv`  
2. Instalar as dependências  
3. Inicializar o `rfbrowser` (para testes com Browser Library)  
4. Executar todos os testes em `tests/`  
5. Abrir o relatório `results/report.html`

---

## 🧱 Opção 2 – Usando Makefile

Se você preferir **Makefile**, use:

```bash
make setup   # Cria ambiente virtual e instala dependências
make test    # Executa os testes e gera relatórios
make clean   # Remove ambiente e resultados
```

---

## 🧪 Estrutura do Projeto

```
.
├─ tests/
│  ├─ web/test_login.robot       # Exemplo com SeleniumLibrary
│  ├─ api/test_users.robot       # Exemplo com RequestsLibrary
│  └─ resources/
│     ├─ variables.robot
│     └─ keywords.robot
├─ results/                      # Relatórios gerados
├─ ebook_robot_framework.pdf     # Ebook completo
├─ ebook_robot_framework_final.pptx  # Slides ilustrados
├─ ebook_robot_framework_slides.pdf  # Slides em PDF
├─ setup_and_run.sh              # Script automatizado
├─ Makefile                      # Automação com make
├─ requirements.txt
├─ .github/workflows/robot.yml   # CI/CD com GitHub Actions
└─ README.md
```

---

## 🔄 CI/CD – GitHub Actions

O workflow `robot.yml` executa automaticamente:
- Instalação de dependências  
- Execução dos testes  
- Upload dos relatórios como artefatos

Acompanhe tudo na aba **Actions** do repositório.

---

## 📘 Materiais Complementares
- Ebook: `ebook_robot_framework.pdf`
- Slides (PowerPoint): `ebook_robot_framework_final.pptx`
- Slides (PDF): `ebook_robot_framework_slides.pdf`
- Banner para o repositório: `banner.png`

---

## 📊 Relatórios
Após rodar os testes, abra:
```
results/report.html
results/log.html
```

---

## 👨‍💻 Autor
**Vinícius Alves Jerônimo**  
📅 2025  
🔗 [LinkedIn](https://linkedin.com/in/viniciusaj14)  
💻 [GitHub](https://github.com/viniciusaj14)  
✉️ vinicius_alves@usp.br
