from fileinput import filename
from turtle import color
import librosa
import librosa.display
import matplotlib.pyplot as plt
import numpy as np

def getPlot(fileName,id):
        imageName = fileName + str(id) + '.png'
        fileName+= '.wav'
        y, sr = librosa.load(fileName)
        tempo, beats = librosa.beat.beat_track(y=y, sr=sr)

        onset_env = librosa.onset.onset_strength(y=y, sr=sr,
                                                aggregate=np.median)
        tempo, beats = librosa.beat.beat_track(onset_envelope=onset_env,
                                        sr=sr)
        hop_length = 512
        

        times = librosa.times_like(onset_env, sr=sr, hop_length=hop_length)
        M = librosa.feature.melspectrogram(y=y, sr=sr, hop_length=hop_length)

        plt.plot(times, librosa.util.normalize(onset_env), color = 'purple',
                label='Song BPM')

        plt.gca().axes.get_xaxis().set_visible(False)
        plt.gca().axes.get_yaxis().set_visible(False)
        plt.legend()
        plt.savefig(imageName)
        plt.switch_backend('agg')
        return imageName
