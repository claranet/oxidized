class ARBOS  < Oxidized::Model

  # Arbor OS model #

  prompt /^[\S\s]+\n([\w.@-]+[:\/#>]+)\s?$/
  comment  '# '

  cmd 'system hardware' do |cfg|
    cfg.gsub! /^Boot\ time\:\s.+/, '' # Remove boot timer
    cfg.gsub! /^Load\ averages\:\s.+/, '' # Remove CPU load info
    cfg = cfg.each_line.to_a[2..-1].join
    comment cfg
  end

  cmd 'system version' do |cfg|
    comment cfg
  end

  cmd 'config show' do |cfg|
    cfg
  end

  cmd 'ip access show' do |cfg|
    cfg
  end

  cfg :ssh do
    post_login 'system lines set 0'
    pre_logout 'exit'
  end
end
