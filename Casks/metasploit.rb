cask "metasploit" do
  version "6.0.17,20201113112909"
  sha256 "7245d3454bcbc30835d128acc9b850ddd2229dc164bf8d3325afa0baebc9a963"

  url "https://osx.metasploit.com/metasploit-framework-#{version.before_comma}%2B#{version.after_comma}-1rapid7-1.pkg"
  appcast "https://osx.metasploit.com/LATEST"
  name "Metasploit Framework"
  desc "Penetration testing framework"
  homepage "https://www.metasploit.com/"

  depends_on formula: "nmap"

  pkg "metasploit-framework-#{version.before_comma}+#{version.after_comma}-1rapid7-1.pkg"
  binary "/opt/metasploit-framework/bin/msfbinscan"
  binary "/opt/metasploit-framework/bin/msfconsole"
  binary "/opt/metasploit-framework/bin/msfd"
  binary "/opt/metasploit-framework/bin/msfdb"
  binary "/opt/metasploit-framework/bin/msfelfscan"
  binary "/opt/metasploit-framework/bin/msfmachscan"
  binary "/opt/metasploit-framework/bin/msfpescan"
  binary "/opt/metasploit-framework/bin/msfrop"
  binary "/opt/metasploit-framework/bin/msfrpc"
  binary "/opt/metasploit-framework/bin/msfrpcd"
  binary "/opt/metasploit-framework/bin/msfvenom"

  uninstall script: {
    executable: "/opt/metasploit-framework/bin/msfremove",
    input:      ["y"],
    sudo:       true,
  },
            rmdir:  "/opt/metasploit-framework"

  zap trash: "~/.msf4"
end
