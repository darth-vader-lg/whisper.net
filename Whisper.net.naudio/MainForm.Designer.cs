// Licensed under the MIT license: https://opensource.org/licenses/MIT

namespace Whisper.net.naudio;

partial class MainForm
{
    /// <summary>
    ///  Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    ///  Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null)) {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Windows Form Designer generated code

    /// <summary>
    ///  Required method for Designer support - do not modify
    ///  the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        buttonRecord = new Button();
        buttonStop = new Button();
        SuspendLayout();
        // 
        // buttonRecord
        // 
        buttonRecord.Location = new Point(12, 12);
        buttonRecord.Name = "buttonRecord";
        buttonRecord.Size = new Size(75, 23);
        buttonRecord.TabIndex = 0;
        buttonRecord.Text = "&Record";
        buttonRecord.UseVisualStyleBackColor = true;
        buttonRecord.Click += ButtonRecord_Click;
        // 
        // buttonStop
        // 
        buttonStop.Location = new Point(93, 12);
        buttonStop.Name = "buttonStop";
        buttonStop.Size = new Size(75, 23);
        buttonStop.TabIndex = 0;
        buttonStop.Text = "&Stop";
        buttonStop.UseVisualStyleBackColor = true;
        buttonStop.Click += ButtonStop_Click;
        // 
        // MainForm
        // 
        AutoScaleDimensions = new SizeF(7F, 15F);
        AutoScaleMode = AutoScaleMode.Font;
        ClientSize = new Size(800, 450);
        Controls.Add(buttonStop);
        Controls.Add(buttonRecord);
        Name = "MainForm";
        Text = "NAudio";
        ResumeLayout(false);
    }

    #endregion

    private Button buttonRecord;
    private Button buttonStop;
}
