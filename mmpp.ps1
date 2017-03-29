[CmdletBinding(DefaultParameterSetName="interactive")]
param(
    [Parameter(ParameterSetName='interactive')]
    [switch]$i = $true,
    [Parameter(Mandatory=$true, ParameterSetName='restore')]
    [switch]$r = $false,
    [Parameter(ParameterSetName='restore')]
    [string]$src = $null,
    [Parameter(Mandatory=$true, ParameterSetName='save')]
    [switch]$s = $false,
    [Parameter(ParameterSetName='save')]
    [string]$dest = "C:\MMPP"
    
    );

# Returns folder size
function Get-Size
{
    param([string]$pth)
    "{0:n2}" -f ((gci -path $pth -recurse | measure-object -property length -sum).sum /1mb)
}

# Checkbox forms window
function GenerateForm {

    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

    $form1 = New-Object System.Windows.Forms.Form
    $button1 = New-Object System.Windows.Forms.Button
    $listBox1 = New-Object System.Windows.Forms.ListBox
    $listBox2 = New-Object System.Windows.Forms.ListBox
    $checkBox6 = New-Object System.Windows.Forms.CheckBox
    $checkBox5 = New-Object System.Windows.Forms.CheckBox
    $checkBox4 = New-Object System.Windows.Forms.CheckBox
    $checkBox3 = New-Object System.Windows.Forms.CheckBox
    $checkBox2 = New-Object System.Windows.Forms.CheckBox
    $checkBox1 = New-Object System.Windows.Forms.CheckBox
    $label = New-Object System.Windows.Forms.Label
    $label2 = New-Object System.Windows.Forms.Label
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    $global:array = @()

    $b1= $false
    $b2= $false

    #----------------------------------------------
    #Generated Event Script Blocks
    #----------------------------------------------

    $handler_button1_Click= 
    {
        $listBox1.Items.Clear();    
        $listBox1.Items.Add( "You have selected these folders :"  )
        if ($checkBox1.Checked){
            $listBox1.Items.Add( "Documents"  )
            $global:array+="Documents"
        }

        if ($checkBox2.Checked){
            $listBox1.Items.Add( "Downloads"  ) 
            $global:array += "Downloads"
        }

        if ($checkBox3.Checked){
            $listBox1.Items.Add( "Pictures")
            $global:array += "Pictures"
        }
        if ($checkBox4.Checked){
            $listBox1.Items.Add( "Videos")
            $global:array += "Videos"
        }
        if ($checkBox5.Checked){
            $listBox1.Items.Add( "Desktop")
            $global:array += "Desktop"
        }
        if ($checkBox6.Checked){
            $listBox1.Items.Add( "Music")
            $global:array += "Music"
        }

        if ( !$checkBox1.Checked -and !$checkBox2.Checked -and !$checkBox3.Checked -and !$checkBox4.Checked -and !$checkBox5.Checked -and !$checkBox6.Checked) {   $listBox1.Items.Add("Pas de selection...")} 
        $form1.close()
        return $array
        }
        $handler_checkbox_Click= 
        {
        $listBox1.Items.Clear();    
        $listBox1.Items.Add( "You have selected these folders :"  )
        [float]$total = 0
        if ($checkBox1.Checked){
            $size = Get-Size "$global:session\Documents"
            $listBox1.Items.Add( "Documents - $size MB"  )
            $total += [float]$size
        }
        if ($checkBox2.Checked){
            $size = Get-Size "$global:session\Downloads"
            $listBox1.Items.Add( "Downloads - $size MB"  ) 
            $total += [float]$size
        }
        if ($checkBox3.Checked){
            $size = Get-Size "$global:session\Pictures"
            $listBox1.Items.Add( "Pictures - $size MB")
            $total += [float]$size
        }
        if ($checkBox4.Checked){
            $size = Get-Size "$global:session\Videos"
            $listBox1.Items.Add( "Videos - $size MB")
            $total += [float]$size
        }
        if ($checkBox5.Checked){
            $size = Get-Size "$global:session\Desktop"
            $listBox1.Items.Add( "Desktop - $size MB")
            $total += [float]$size
        }
        if ($checkBox6.Checked){
            $size = Get-Size "$global:session\Music"
            $listBox1.Items.Add( "Music - $size MB")
            $total += [float]$size
        }
        if ( !$checkBox1.Checked -and !$checkBox2.Checked -and !$checkBox3.Checked -and !$checkBox4.Checked -and !$checkBox5.Checked -and !$checkBox6.Checked) {   $listBox1.Items.Add("Pas de selection...")} 
        $total = $total/100
        $label2.text = "TOTAL : $total MB"
        return $array
    }

    $OnLoadForm_StateCorrection=
    {#Correct the initial state of the form to prevent the .Net maximized form issue
        $form1.WindowState = $InitialFormWindowState
    }

    #----------------------------------------------
    #region Generated Form Code
    $form1.Text = "Directories"
    $form1.Name = "form1"
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 550
    $System_Drawing_Size.Height = 336
    $form1.ClientSize = $System_Drawing_Size

    $button1.TabIndex = 6
    $button1.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button1.Size = $System_Drawing_Size
    $button1.UseVisualStyleBackColor = $True

    $button1.Text = "Submit"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 460
    $System_Drawing_Point.Y = 290
    $button1.Location = $System_Drawing_Point
    $button1.DataBindings.DefaultDataSourceUpdateMode = 0
    $button1.add_Click($handler_button1_Click)

    $form1.Controls.Add($button1)

    $listBox1.FormattingEnabled = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 301
    $System_Drawing_Size.Height = 180
    $listBox1.Size = $System_Drawing_Size
    $listBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $listBox1.Name = "listBox1"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 187
    $System_Drawing_Point.Y = 47
    $listBox1.Location = $System_Drawing_Point
    $listBox1.TabIndex = 3

    $form1.Controls.Add($listBox1)

    $checkBox6.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 150
    $System_Drawing_Size.Height = 34
    $checkBox6.Size = $System_Drawing_Size
    $checkBox6.TabIndex = 5
    $checkBox6.Text = "Music"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 190
    $checkBox6.Location = $System_Drawing_Point
    $checkBox6.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox6.Name = "checkBox6"
    $checkBox6.add_Click($handler_checkbox_Click)

    $form1.Controls.Add($checkBox6)

    $checkBox5.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 150
    $System_Drawing_Size.Height = 34
    $checkBox5.Size = $System_Drawing_Size
    $checkBox5.TabIndex = 4
    $checkBox5.Text = "Desktop"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 160
    $checkBox5.Location = $System_Drawing_Point
    $checkBox5.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox5.Name = "checkBox5"
    $checkBox5.add_Click($handler_checkbox_Click)

    $form1.Controls.Add($checkBox5)


    $checkBox4.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 150
    $System_Drawing_Size.Height = 34
    $checkBox4.Size = $System_Drawing_Size
    $checkBox4.TabIndex = 3
    $checkBox4.Text = "Videos"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 130
    $checkBox4.Location = $System_Drawing_Point
    $checkBox4.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox4.Name = "checkBox4"
    $checkBox4.add_Click($handler_checkbox_Click)

    $form1.Controls.Add($checkBox4)

    $checkBox3.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 150
    $System_Drawing_Size.Height = 34
    $checkBox3.Size = $System_Drawing_Size
    $checkBox3.TabIndex = 2
    $checkBox3.Text = "Pictures"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 100
    $checkBox3.Location = $System_Drawing_Point
    $checkBox3.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox3.Name = "checkBox3"
    $checkBox3.add_Click($handler_checkbox_Click)

    $form1.Controls.Add($checkBox3)


    $checkBox2.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 150
    $System_Drawing_Size.Height = 34
    $checkBox2.Size = $System_Drawing_Size
    $checkBox2.TabIndex = 1
    $checkBox2.Text = "Downloads"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 70
    $checkBox2.Location = $System_Drawing_Point
    $checkBox2.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox2.Name = "checkBox2"
    $checkBox2.add_Click($handler_checkbox_Click)
    $form1.Controls.Add($checkBox2)



    $checkBox1.UseVisualStyleBackColor = $True
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 150
    $System_Drawing_Size.Height = 34
    $checkBox1.Size = $System_Drawing_Size
    $checkBox1.TabIndex = 0
    $checkBox1.Text = "Documents"
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 27
    $System_Drawing_Point.Y = 40
    $checkBox1.Location = $System_Drawing_Point
    $checkBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $checkBox1.Name = "checkBox1"
    $checkBox1.add_Click($handler_checkbox_Click)

    $form1.Controls.Add($checkBox1)
    
    $label.Text = "Directories to save :"
    $label.Location = New-Object System.Drawing.Point(10,10) 
    $label.Size = New-Object System.Drawing.Size(300,50) 
    $form1.Controls.Add($label)
    
    $label2.Text = "TOTAL : "
    $label2.Location = New-Object System.Drawing.Point(420,250) 
    $label2.Size = New-Object System.Drawing.Size(150,50) 
    
    $form1.Controls.Add($label2)

    #Save the initial state of the form
    $InitialFormWindowState = $form1.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $form1.add_Load($OnLoadForm_StateCorrection)
    #Show the Form
    $form1.ShowDialog()| Out-Null
} 

# Save or restore
function choice{
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

    $form1 = New-Object System.Windows.Forms.Form
    $button1 = New-Object System.Windows.Forms.Button
    $button2 = New-Object System.Windows.Forms.Button
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    
    $OnLoadForm_StateCorrection=
    {#Correct the initial state of the form to prevent the .Net maximized form issue
        $form1.WindowState = $InitialFormWindowState
    }
    $handler_button1_Click= 
    {
        $global:mode = 1;
        $form1.close()
    }
    $handler_button2_Click= 
    {
        $global:mode = 2;
        $form1.close()
    }
    #region Generated Form Code
    $form1.Text = "Save / restore"
    $form1.Name = "form1"
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 250
    $System_Drawing_Size.Height = 100
    $form1.ClientSize = $System_Drawing_Size

    $button1.TabIndex = 0
    $button1.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button1.Size = $System_Drawing_Size
    $button1.UseVisualStyleBackColor = $True

    $button1.Text = "Save"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 35
    $System_Drawing_Point.Y = 40
    $button1.Location = $System_Drawing_Point
    $button1.DataBindings.DefaultDataSourceUpdateMode = 0
    $button1.add_Click($handler_button1_Click)

    $form1.Controls.Add($button1)
    
    
    $button2.TabIndex = 1
    $button2.Name = "button2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button2.Size = $System_Drawing_Size
    $button2.UseVisualStyleBackColor = $True

    $button2.Text = "Restore"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X =135
    $System_Drawing_Point.Y = 40
    $button2.Location = $System_Drawing_Point
    $button2.DataBindings.DefaultDataSourceUpdateMode = 0
    $button2.add_Click($handler_button2_Click)

    $form1.Controls.Add($button2)
    #Save the initial state of the form
    $InitialFormWindowState = $form1.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $form1.add_Load($OnLoadForm_StateCorrection)
    #Show the Form
    $form1.ShowDialog()| Out-Null
    
}
function profileForm{
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    
    $label = New-Object System.Windows.Forms.Label
    $form1 = New-Object System.Windows.Forms.Form
    $button1 = New-Object System.Windows.Forms.Button
    $button2 = New-Object System.Windows.Forms.Button
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    Add-Type -AssemblyName System.Windows.Forms
    $app = new-object -com Shell.Application
    $OnLoadForm_StateCorrection=
    {#Correct the initial state of the form to prevent the .Net maximized form issue
        $form1.WindowState = $InitialFormWindowState
    }
    $handler_button1_Click= 
    {
        $global:session = $textBox.Text
        $form1.close()
    }
    $handler_browse_Click= 
    {
        $FolderBrowser = $app.BrowseForFolder(0, "Select Folder", 0, "C:\Users\")
        if (!($FolderBrowser.Self.Path)) {
            $textBox.Text = $ENV:USERPROFILE
        }
        else{
            $textBox.Text = $FolderBrowser.Self.Path
        }
    }
    #region Generated Form Code
    $form1.Text = "Profile"
    $form1.Name = "form1"
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 350
    $System_Drawing_Size.Height = 150
    $form1.ClientSize = $System_Drawing_Size

    $button1.TabIndex = 0
    $button1.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button1.Size = $System_Drawing_Size
    $button1.UseVisualStyleBackColor = $True

    $button1.Text = "Submit"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 100
    $System_Drawing_Point.Y = 100
    $button1.Location = $System_Drawing_Point
    $button1.DataBindings.DefaultDataSourceUpdateMode = 0
    $button1.add_Click($handler_button1_Click)

    $form1.Controls.Add($button1)

    $button2.TabIndex = 1
    $button2.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button2.Size = $System_Drawing_Size
    $button2.UseVisualStyleBackColor = $True

    $button2.Text = "Browse..."

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 240
    $System_Drawing_Point.Y = 58
    $button2.Location = $System_Drawing_Point
    $button2.DataBindings.DefaultDataSourceUpdateMode = 0
    $button2.add_Click($handler_browse_Click)

    $form1.Controls.Add($button2)
    
    $label.Location = New-Object System.Drawing.Point(10,10) 
    $label.Size = New-Object System.Drawing.Size(300,50) 
    if($global:mode -eq 1){
        $text = "User profile to save (Default : [$global:name]): "
    }
    else{
        $text = "User profile to restore (Default : [$global:name]): "
    }
    
    $label.Text = $text
    $form1.Controls.Add($label)
    
    $textBox = New-Object System.Windows.Forms.TextBox 
    $textBox.Location = New-Object System.Drawing.Point(30,60) 
    $textBox.Size = New-Object System.Drawing.Size(200,20) 
    $textBox.Text = "C:\Users\$global:name"
    
    $form1.Controls.Add($textBox)
    
    $form1.Controls.Add($textBox)
    #Save the initial state of the form
    $InitialFormWindowState = $form1.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $form1.add_Load($OnLoadForm_StateCorrection)
    $form1.Topmost = $True
    #Show the Form
    $form1.ShowDialog()| Out-Null
}
function inputForm {
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    
    $app = new-object -com Shell.Application
    $label = New-Object System.Windows.Forms.Label
    $form1 = New-Object System.Windows.Forms.Form
    $button1 = New-Object System.Windows.Forms.Button
    $button2 = New-Object System.Windows.Forms.Button
    $colorDialog = new-object System.Windows.Forms.ColorDialog
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    
    $OnLoadForm_StateCorrection=
    {#Correct the initial state of the form to prevent the .Net maximized form issue
        $form1.WindowState = $InitialFormWindowState
    }
    $global:i = 0
    $handler_button1_Click= 
    {
        if (!($textBox.Text)){
            if($global:i -lt 1){
                $label.Text += "Choose a directory ! "
            }
            $global:i = $global:i + 1
        }
        if ($textBox.Text){
            $global:input = $textBox.Text;
            $form1.close()
        }
    }
      $handler_browse_Click= 
    {
        $FolderBrowser = $app.BrowseForFolder(0, "Select Folder", 0, "Computer")
        $textBox.Text = $FolderBrowser.Self.Path
        $global:input = $FolderBrowser.Self.Path
    }
    
    #region Generated Form Code
    $form1.Text = "Select folder"
    $form1.Name = "form1"
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 350
    $System_Drawing_Size.Height = 150
    $form1.ClientSize = $System_Drawing_Size

    $button1.TabIndex = 0
    $button1.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button1.Size = $System_Drawing_Size
    $button1.UseVisualStyleBackColor = $True

    $button1.Text = "Submit"

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 250
    $System_Drawing_Point.Y = 120
    $button1.Location = $System_Drawing_Point
    $button1.DataBindings.DefaultDataSourceUpdateMode = 0
    $button1.add_Click($handler_button1_Click)

    $form1.Controls.Add($button1)
    
    $button2.TabIndex = 1
    $button2.Name = "button2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 75
    $System_Drawing_Size.Height = 23
    $button2.Size = $System_Drawing_Size
    $button2.UseVisualStyleBackColor = $True

    $button2.Text = "Browse..."

    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 240
    $System_Drawing_Point.Y = 58
    $button2.Location = $System_Drawing_Point
    $button2.DataBindings.DefaultDataSourceUpdateMode = 0
    $button2.add_Click($handler_browse_Click)

    $form1.Controls.Add($button2)

    $label.Location = New-Object System.Drawing.Point(10,10) 
    $label.Size = New-Object System.Drawing.Size(300,50) 
    if($global:mode -eq 1){
        $text = "Select destination folder : "
    }
    else{
        $text = "Select source : "
    }
    
    $label.Text = $text
    $form1.Controls.Add($label)
    
    Add-Type -AssemblyName System.Windows.Forms
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    
    
    $textBox = New-Object System.Windows.Forms.TextBox 
    $textBox.Location = New-Object System.Drawing.Point(30,60) 
    $textBox.Size = New-Object System.Drawing.Size(200,20) 
    
    $form1.Controls.Add($textBox)
    #Save the initial state of the form
    $InitialFormWindowState = $form1.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $form1.add_Load($OnLoadForm_StateCorrection)
    $form1.Topmost = $True
    $form1.Add_Shown({$textBox.Select()})
    #Show the Form
    $form1.ShowDialog()| Out-Null
    
}
$name = $ENV:USERNAME;
$global:name = $ENV:USERNAME;
function getDest{
    param([string]$dest)
    if (!(Test-Path $dest)){
        New-Item -ItemType Directory -Path $dest -Force > $null
    }
    else{
        clearDest $dest
    }
}
function clearDest{
    param([string]$dest)
    $old = $dest + ".old"
    Rename-Item -path $dest -newname $old
        #Remove-Item $dest\ -recurse -force
}
function getProfileTd{
    param([string]$session, [string]$dest)
    mkdir $dest\Thunderbird\  > $null;
    $dest = "$dest\Thunderbird"
    $session= "$session\AppData\Roaming\Thunderbird\";
    #$folder = Get-ChildItem $session | ?{ $_.PSIsContainer };
    $size = Get-Size $session
    echo "$size MB to copy in folder $session"
    Robocopy /E /256 $session $dest > $null
    #Copy-WithProgress -Source $session\$folder -Destination $dest
    echo "Thunderbird profile saved in $dest";
}
function getProfileFirefox{
    param([string]$session, [string]$dest)
    mkdir $dest\Firefox\ > $null;
    $dest = "$dest\Firefox\"
    $session ="$session\AppData\Roaming\Mozilla\";
    #Copy-WithProgress -Source $session -Destination $dest
    $size = Get-Size $session
    echo "$size MB to copy in folder $session"
    Robocopy /E /256 $session  $dest > $null
    echo "Firefox profile saved in $dest";
}

if ($i -eq $true){
    choice
    if ($global:mode -eq 1){
        inputForm
        profileForm
        $session = $global:session
        $dest = $global:input
        mkdir $dest\User\ > $null;
        GenerateForm
        getProfileTd $session $dest ;
        getProfileFirefox $session $dest;
        foreach ($res in $global:array){
            $BackupSource = "$session\$res"
            mkdir "$dest\User\$res" > $null
            $size = Get-Size $BackupSource
            echo "$size MB to copy in folder $session\$res\"
            $BackupDestination = "$dest\User\$res"
            if ($res -eq "Documents"){
                Robocopy /E /SL /256 /MT /xjd $BackupSource $BackupDestination > $null
            }
            else{
                Robocopy /E /256 /MT $BackupSource $BackupDestination > $null
            }
            #Copy-WithProgress -Source $BackupSource -Destination $BackupDestination
            echo "saving in $dest\User\$res"
        }
        echo "Save done" 
    }
    else{
        profileForm
        $session = $global:session
        inputForm
        $src = $global:input
        $thunder = "$session\AppData\Roaming\Thunderbird"
        getDest $thunder
        echo "Restoring Thunderbird"
        Robocopy /E /MT "$src\Thunderbird\" "$thunder\" > $null
        $firefox = "$session\AppData\Roaming\Mozilla"
        getDest $firefox
        echo "Restoring Firefox"
        Robocopy /E /MT "$src\Firefox\" $firefox > $null
        
        $array = Get-ChildItem "$src\User\" | 
        Where-Object {$_.PSIsContainer} | 
        Foreach-Object {$_.Name}
        
        $directoryInfo = Get-ChildItem "$src\User\" | Measure-Object
        if($directoryInfo.count -gt 0){
            foreach ($directory in $array){
                $source = "$src\User\$directory\"
                $path = "$session\$directory\"
                echo "Saving $source in $path"
                Robocopy /E /MT $source $path > $null
            }
        }
        echo "Restoration done"
    }
}