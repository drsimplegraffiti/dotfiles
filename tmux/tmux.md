## Session Management
```bash
tmux new -s <session-name> → Create a new session `tmux new -s <name of session>`
tmux ls → List sessions  
tmux attach -t <session-name> → Attach to a session `tmux a -t <index of session>`  
tmux detach (or Ctrl+b d) → Detach from the current session  
tmux a → Attach back to a session  
tmux kill-session -t <session-name> → Kill a specific session `tmux kill-session <name of session>`  
tmux kill-server → Kill all sessions  
```

## Window Management
```bash
Ctrl+b c → Create a new window  
Ctrl+b w → List windows (move around windows) or `Ctrl + b + s`  
Ctrl+b n → Next window  
Ctrl+b p → Previous window  
Ctrl+b & → Close the current window (kill all windows)  
Ctrl+b <number> → Switch to window number e.g., `Ctrl + b + 1`  
```

### Enter Command Mode
```bash
Ctrl + b + : → Then enter your command e.g., `:rename-window bob` or `rename-session poop`  
```

## Pane Management
```bash
Ctrl+b % → Split vertically  
Ctrl+b " → Split horizontally  
Ctrl+b o → Switch between panes  
Ctrl+b x → Close the current pane  
`Ctrl+b <arrow>` → Resize pane. Hold `Ctrl + b` down and move the arrow  
Ctrl+b z → Toggle pane zoom  
```

### Copy Mode & Scrolling
```bash
Ctrl+b [ → Enter copy mode (use arrow keys to scroll)  
Ctrl+b ] → Paste copied text  
Ctrl+b q → Move around windows e.g., Ctrl+b q 1 or Ctrl+b q 2  
```

## Miscellaneous
```bash
Ctrl+b ? → Show tmux help
tmux source-file ~/.tmux.conf → Reload config
```


### Add the Following to the Config File
```bash
vi ~/.tmux.conf
```


### Enter Command Mode
```bash
Ctrl + b + : → Then enter your command e.g., `:rename-window bob` or `rename-session poop`  
```



### Edit Tmux Config File
```bash
vi ~/.tmux.conf
```
And add this:
```bash
set -g mouse on
setw -g mode-keys vi
```
Then source tmux:  
```bash
tmux source ~/.tmux.conf
or
tmux source-file ~/.tmux.conf
```

### Make Tmux Look Beautiful
Install the tmux plugin manager (TPM):  
```shell
wsl
tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
```

### Add the Following to the Config File
```shell
vi ~/.tmux.conf
```


```bash

# set zsh as default
set -g default-shell /bin/zsh

# Enable 256-color and true-color (24-bit) support in tmux
set -g default-terminal "screen-256color" # Set terminal type for 256-color support
set -ga terminal-overrides ",*256col*:Tc" # Override to enable true-color for compatible terminals

# General
set -g set-clipboard on         # Use system clipboard
set -g detach-on-destroy off    # Don't exit from tmux when closing a session
    set -g escape-time 0            # Remove delay for exiting insert mode with ESC in Neovim
set -g history-limit 1000000    # Increase history size (from 2,000)
    set -g mouse on                 # Enable mouse support
set -g status-interval 3        # Update the status bar every 3 seconds (default: 15 seconds)

# Use Vim-style keybindings in copy mode
    setw -g mode-keys vi

# Set prefix key
    unbind C-b              # Unbind the default prefix key
    set -g prefix C-Space   # Set new prefix key to Ctrl+Space

# Refresh tmux config with r
    unbind r
    bind r source-file ~/.tmux.conf;display-message "Config reloaded..."

# Split horizontally in CWD with \
        unbind %
    bind \\ split-window -h -c "#{pane_current_path}"

# Split vertically in CWD with -
    unbind \"
    bind - split-window -v -c "#{pane_current_path}"

# New window in same path
    bind c new-window -c "#{pane_current_path}"


# Use vim arrow keys to resize
    bind -r j resize-pane -D 5
    bind -r k resize-pane -U 5
    bind -r l resize-pane -R 5
    bind -r h resize-pane -L 5

# Use m key to maximize pane
    bind -r m resize-pane -Z


# Enable vi mode to allow us to use vim keys to move around in copy mode (Prefix + [ places us in copy mode)
    set-window-option -g mode-keys vi

# Start selecting text with "v"
    bind-key -T copy-mode-vi 'v' send -X begin-selection 

# Copy text with "y"
    bind -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel "pbcopy"

# Paste yanked text with "Prefix + P" ("Prefix + p" goes to previous window)
    bind P paste-buffer

# Don't exit copy mode when dragging with mouse
    unbind -T copy-mode-vi MouseDragEnd1Pane

# Start windows and panes at 1, not 0
    set -g base-index 1
    set -g pane-base-index 1
    set -g renumber-windows on # Automatically renumber windows when one is closed

# List of plugins
    set -g @plugin 'tmux-plugins/tpm'        # Tmux Plugin Manager
    set -g @plugin 'catppuccin/tmux'         # Catppuccin theme

    set -g @plugin 'tmux-plugins/tmux-resurrect'    # Persist tmux sessions after computer restart
    set -g @plugin 'tmux-plugins/tmux-continuum'    # Automatically saves sessions every 15 minutes
    set -g @plugin 'christoomey/vim-tmux-navigator'
#set -g @plugin 'hendrikmi/tmux-cpu-mem-monitor' # CPU and memory info

#set -g status-right "Γëí╞Æ├╗├æΓê⌐Γòò├à CPU: #(cpu -i 3) | Γëí╞Æ┬║├í MEM: #(mem)"
    set -g status-justify centre
    set -g status-right-length 200  # default: 10
    set -g status-left-length 200   # default: 10


# Catppuccin Theme Settings
    set -g @catppuccin_flavor 'mocha'        # Options: 'latte', 'frappe', 'macchiato', 'mocha'
    set -g @catppuccin_window_tabs_enabled on
    set -g @catppuccin_show_focused_process on
    set -g @catppuccin_date_time "%H:%M %d-%m-%Y" # Custom date format

# Status bar settings
#set -g status-position top               # Move status bar to top
#set -g status-style bg=black,fg=white    # Default status bar color
#set -g status-left "#[fg=cyan] Γê⌐├áΓò¥ #[fg=white] #S"   # Show session name with Linux icon
#set -g status-right "#[fg=yellow] %Y-%m-%d #[fg=green]%H:%M"  # Date & Time on the right



# Resurrect
    set -g @resurrect-capture-pane-contents 'on'
# set -g @continuum-restore 'on'


# Window list styling
    setw -g window-status-format " #I:#W "   # Show window index & name
    setw -g window-status-current-format " #[fg=blue,bold]#I:#W "  # Highlight active window




bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

set-option -g set-clipboard on

# Initialize TMUX Plugin Manager (TPM)
run-shell '~/.tmux/plugins/tpm/tpm'

```

For conflict:

```bash
rm -f ~/.tmux.conf.swp
```
Save and exit.  

Then press `Ctrl + b + I` (capital `I` to install plugins).  

You should have something like this:  
![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/4k2vnuvme3211vjp9p9o.png)


#### copy from tmux to window
```bash
cat ~/.tmux.conf | clip.exe
```

