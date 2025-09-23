def timer_start
  return if $timer[:running]
  $timer[:started_at] = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  $timer[:running] = true
end

def timer_pause
  return unless $timer[:running]
  now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  $timer[:accumulated] += (now - $timer[:started_at])
  $timer[:started_at] = nil
  $timer[:running] = false
end

def timer_elapsed
  if $timer[:running] && $timer[:started_at]
    now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    $timer[:accumulated] + (now - $timer[:started_at])
  else
    $timer[:accumulated]
  end
end

def timer_reset
  $timer[:started_at] = nil
  $timer[:accumulated] = 0.0
  $timer[:running] = false
end

def format_duration(sec)
  sec = sec.to_i
  h = sec / 3600
  m = (sec % 3600) / 60
  s = sec % 60
  h > 0 ? format("%02d:%02d:%02d", h, m, s) : format("%02d:%02d", m, s)
end

def start_new_game
  # … your other setup …
  timer_reset
  timer_start
end