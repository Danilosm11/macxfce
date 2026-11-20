# macxfce

Customização **macOS-like leve** para XFCE: dock translúcida com cantos arredondados,
barra superior estilo menu bar e botões de janela à esquerda.

- **Sem bloat** — um script bash + ~40 linhas de Python usando só o que o XFCE já traz (xfconf, GdkPixbuf).
- **Sem telemetria** — não acessa a rede, nunca.
- **Linux, open source pra sempre** — GPL-3.0.

## Modos da dock

| Modo | Comando | O que faz |
|---|---|---|
| Adaptativo | `macxfce adaptive` | Amostra a cor do wallpaper (faixa de baixo para a dock, faixa de cima para a barra) e tinge os painéis com ela. Escolhe texto claro ou escuro pela luminância. Atualiza sozinho ao trocar wallpaper ou workspace. |
| Escuro | `macxfce dark` | Grafite translúcido. |
| Claro | `macxfce light` | Branco translúcido, texto escuro. |
| Translúcido | `macxfce glass` | Vidro quase transparente. |

Também: `macxfce menu` (janelinha de escolha, via zenity), `macxfce cycle`, `macxfce status`.
O menu também aparece como **"Estilo da Dock"** no menu de aplicativos.

## Instalação

```sh
git clone https://github.com/Danilosm11/macxfce.git
cd macxfce
./install.sh            # ou ./install.sh dark | light | glass
```

Instala só no seu usuário (`~/.local`), sem sudo. Requer XFCE ≥ 4.14 com compositor do xfwm4
(ativado automaticamente), `python3-gi`, `xprop`, `xrandr`. Melhor com o plugin
[docklike](https://docs.xfce.org/panel-plugins/xfce4-docklike-plugin/start) num painel inferior.

## Como funciona

- A dock é o painel que contém o plugin `docklike` (ou `tasklist`); a barra é o painel no topo.
  Para forçar outros, edite `~/.config/macxfce/config` (`DOCK_PANEL=`, `BAR_PANEL=`).
- As cores vão em `background-rgba` de cada painel via `xfconf-query`.
- Cantos arredondados e cor do texto ficam num bloco marcado em `~/.config/gtk-3.0/gtk.css`.
- O modo adaptativo roda um watcher orientado a eventos (`xfconf-query -m` + `xprop -spy`),
  sem polling; ele só existe enquanto o modo é `adaptive`.

## Ativar, desativar, desinstalar

| Comando | O que faz |
|---|---|
| `macxfce off` (ou `desativar`) | Volta ao visual original (cores, `gtk.css`, botões) e para o watcher. Continua instalado. |
| `macxfce on` (ou `ativar` / `reativar`) | Liga de novo no último modo usado. Faz um novo backup do visual atual antes. |
| `macxfce uninstall` (ou `desinstalar`, `./uninstall.sh`) | Desativa e apaga tudo de `~/.local` e `~/.config`. |

Escolher um modo (`macxfce dark` etc.) com ele desligado também reativa.
`macxfce buttons right` deixa os botões das janelas à direita mesmo com o resto ativo.

## Licença

GPL-3.0-or-later. Este projeto não coleta nem envia dado nenhum.
