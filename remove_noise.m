 function clear_audio = remove_noise(noisy_audio, Fs)
  order = 7;
  [b,a] = butter(order,1000/(Fs/2),'low');
  clear_audio = filter(b,a,noisy_audio);
end