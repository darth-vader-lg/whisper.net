// Licensed under the MIT license: https://opensource.org/licenses/MIT

using NAudio.Wave;

namespace Whisper.net.naudio;

public partial class MainForm : Form
{
    private WaveInEvent? waveIn;
    public MainForm()
    {
        InitializeComponent();
    }

    private void ButtonRecord_Click(object sender, EventArgs e)
    {
        if (waveIn != null)
        {
            return;
        }

        waveIn = new WaveInEvent
        {
            DeviceNumber = 0,
            WaveFormat = new WaveFormat(44100, WaveIn.GetCapabilities(0).Channels)
        };
        waveIn.DataAvailable += WaveIn_DataAvailable;
        waveIn.RecordingStopped += WaveIn_RecordingStopped;
        waveIn.StartRecording();
    }

    private void WaveIn_RecordingStopped(object? sender, StoppedEventArgs e)
    {
    }

    private void ButtonStop_Click(object sender, EventArgs e)
    {
        if (waveIn == null)
        {
            return;
        }

        waveIn.StopRecording();
        waveIn = null;
    }

    private void WaveIn_DataAvailable(object? sender, WaveInEventArgs e)
    {
    }
}
