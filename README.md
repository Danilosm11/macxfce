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
git clone https://github.com/<você>/macxfce.git
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

## Desinstalar

```sh
./uninstall.sh
```

Restaura o backup feito na primeira execução (cores dos painéis, `gtk.css`, layout dos botões).
`macxfce buttons right` devolve só os botões das janelas para a direita.

## Licença

GPL-3.0-or-later. Este projeto não coleta nem envia dado nenhum.
