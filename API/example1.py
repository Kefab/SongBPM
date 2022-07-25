import librosa
import librosa.display
import matplotlib.pyplot as plt
import numpy as np

def image():
    y, sr = librosa.load(librosa.ex('choice'), duration=10)
    tempo, beats = librosa.beat.beat_track(y=y, sr=sr)

    onset_env = librosa.onset.onset_strength(y=y, sr=sr,
                                            aggregate=np.median)
    tempo, beats = librosa.beat.beat_track(onset_envelope=onset_env,
                                        sr=sr)

    hop_length = 512
    fig, ax = plt.subplots(nrows=2, sharex=True)
    times = librosa.times_like(onset_env, sr=sr, hop_length=hop_length)
    M = librosa.feature.melspectrogram(y=y, sr=sr, hop_length=hop_length)
    librosa.display.specshow(librosa.power_to_db(M, ref=np.max),
                            y_axis='mel', x_axis='time', hop_length=hop_length,
                            ax=ax[0])

    print(ax)
    ax[0].label_outer()
    ax[0].set(title='Mel spectrogram')
    ax[1].plot(times, librosa.util.normalize(onset_env),
            label='Onset strength')

    ax[1].vlines(times[beats], 0, 1, alpha=0.5, color='r',
                linestyle='--', label='Beats')
    ax[1].legend()
    plt.savefig('2.png')