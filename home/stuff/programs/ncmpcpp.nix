{config, ...}:
{
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = ~/Music;
    settings = {
      autocenter_mode = "yes";
      follow_now_playing_lyrics = "yes";
      lyrics_directory = "~/.lyrics";
      fetch_lyrics_for_current_song_in_background = "yes";
      #store_lyrics_in_song_dir = yes;
      browser_sort_mode="mtime";
      colors_enabled = "yes";
      main_window_color = "white";
      header_window_color = "180";
      volume_color = "215";
      progressbar_color = "180";
      progressbar_elapsed_color = "16";
      statusbar_color = "43";
      active_window_border = "blue";
      user_interface = "alternative";
      #song_list_format="(4)[230]{l}";
      song_columns_list_format = "(4)[230]{l} (20)[219]{t} (12)[180]{a} (16)[215]{b}";
      song_list_format = "{$(219)%a} - {$(230)%t}";
      #song_list_format = "{$7%a - $9}{$5%t$9}|{$5%f$9}$R{$6%b $9}{$3%l$9}";
      song_status_format = " $6%a $7⟫⟫ $3%t $7⟫⟫ $4%b ";
      visualizer_data_source  = "/tmp/g.fifo";
      #visualizer_output_name = "my_fifo";
      visualizer_type = "spectrum";
      #visualizer_type = "ellipse";
      visualizer_fps = "144";
      visualizer_in_stereo = "yes";
      visualizer_look = "◆▋";
      visualizer_spectrum_smooth_look="yes";
      playlist_editor_display_mode = "classic";
      playlist_display_mode = "columns";
      cyclic_scrolling = "yes";
      lines_scrolled = "2";
      system_encoding = "utf-8";
      regular_expressions = "extended";
      #selected_item_prefix = "* "
      #discard_colors_if_item_is_selected = "no"
      #incremental_seeking = "yes"
      #seek_time = "1"
      header_visibility = "yes";
      statusbar_visibility = "yes";
      titles_visibility = "yes";
      progressbar_look =  "▃▃▃";
      now_playing_prefix = "> ";
      centered_cursor = "yes";
      display_bitrate = "yes";
      enable_window_title = "yes";
      empty_tag_marker = "";
      execute_on_song_change="${config.home.homeDirectory}/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp_cover_art.sh";
    };
  };
}
