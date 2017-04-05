class ARBOS  < Oxidized::Model

  # Arbor OS model #

  prompt /^[\S\s]+\n([\w.@-]+[:\/#>]+)\s?$/
  comment  '# '

  cmd 'system hardware' do |cfg|
    comment cfg
  end

  cmd 'system version' do |cfg|
    comment cfg
  end

  cmd 'config show' do |cfg|
    cfg
  end

  cfg :ssh do
    exec true
  end
end
