using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.IO;

namespace MissionMerge
{
    static class Program
    {
        private static string sBaseFile = "";
        private static string sAddonFile = "";
        public static string sOutputFile = "merged.mission.lvl";
        private static string sSearchPath = null; 

        public static string version { get { return System.Reflection.Assembly.GetEntryAssembly().GetName().Version.ToString(); } }

        /// <summary>
        /// The main entry point for the application.
        /// 
        /// </summary>
        [STAThread]
        static int Main(string[] args)
        {
            if (args.Length == 0)
            {
                Console.WriteLine("Use '-h' to list help message.");
                /*if (Directory.Exists(".\\addon") && File.Exists("base.mission.lvl"))
                {
                    ProcessAddons(".\\");
                }
                else if (Directory.GetCurrentDirectory().ToLower().EndsWith("addon") && File.Exists("base.mission.lvl"))
                {
                    ProcessAddons("..\\");
                }
                else*/
                {
                    Application.EnableVisualStyles();
                    Application.SetCompatibleTextRenderingDefault(false);
                    Application.Run(new MissionMergeForm());
                }
                return 0;
            }
            #region process args...
            string arg = "";
            for (int i = 0; i < args.Length; i += 2)
            {
                arg = args[i].ToLower();
                if ("-h /h /? --help".IndexOf(arg) > -1)
                {
                    Console.WriteLine(sHelpMsg);
                    return 0;
                }
                else if (arg == "-base_mission" && args.Length > i + 1)
                    sBaseFile = args[i + 1];
                else if (arg == "-addon_missions" && args.Length > i + 1)
                    sAddonFile = args[i + 1];
                else if (arg == "-output" && args.Length > i + 1)
                    sOutputFile = args[i + 1];
                else if (arg == "-search_path")
                    sSearchPath = args[i + 1];
            }
            #endregion

            if (sSearchPath != null)
            {
                string errMsg = null;
                if (String.IsNullOrEmpty(sBaseFile))
                    errMsg = "Error! Must specify mase mission file.";
                else if (!File.Exists(sBaseFile))
                    errMsg = String.Format("Error, File '{0}' does not exist!", sBaseFile);
                else if (!Directory.Exists(sSearchPath))
                    errMsg = String.Format("Error, Folder '{0}' does not exist!", sSearchPath);
                if (errMsg != null)
                {
                    Console.WriteLine(errMsg);
                    return 1;
                }
                ProcessAddons(sSearchPath);
                return 0;
            }

            if (!File.Exists(sBaseFile) || !File.Exists(sAddonFile))
            {
                Console.Error.WriteLine("Both 'base_mission' and 'addon_missions' files must be specified!\n");
                Console.Error.WriteLine(sHelpMsg);
                return 1;
            }
            //Use the MissionMergeForm to do our bidding
            MissionMergeForm form = new MissionMergeForm();
            form.ConsoleMode = true;
            Console.WriteLine("Reading files...");
            form.DefaultOutputFileName = sOutputFile;
            form.BaseFileName = sBaseFile;
            form.AddonMissionFileName = sAddonFile;
            Console.WriteLine("Merging...");
            form.MergeLevels();
            Console.WriteLine("Saving...");
            form.SaveMissionFile();
            form.Dispose();

            return 0;
        }

        private static void ProcessAddons(string relativeDir)
        {
            //Use the MissionMergeForm to do the work 
            MissionMergeForm form = new MissionMergeForm();
            form.ConsoleMode = true;
            form.DefaultOutputFileName = sOutputFile;
            form.BaseFileName = sBaseFile;
            string mission_file = "";
            string[] missions = Directory.GetFiles(relativeDir, "mission.lvl", SearchOption.AllDirectories);

            Console.WriteLine("Found {0} mission.lvl files", missions.Length);
            for (int i = 0; i < missions.Length; i++)
            {
                mission_file = missions[i];
                Console.WriteLine("Merging '{0}'...", mission_file);
                form.AddonMissionFileName = mission_file;
                form.MergeLevels();
            }
            Console.WriteLine("Saving...");
            string outFile = form.SaveMissionFile();
            MessageBox.Show("New mission file saved to:\r\n" + Path.GetFullPath(outFile));
            form.Dispose();
        }

        /*
        private static void ProcessAddons(string relativeDir)
        {
            //Use the MissionMergeForm to do the work 
            MissionMergeForm form = new MissionMergeForm();
            form.ConsoleMode = true;
            form.DefaultOutputFileName = relativeDir + "mission.lvl";
            form.BaseFileName =  "base.mission.lvl";
            string mission_file = "";

            Console.WriteLine("Reading files...");
            for (int i = 0; i < 1000; i++)
            {
                if( relativeDir == ".\\")
                    mission_file = String.Format(".\\addon\\{0:000}\\mission.lvl", i);
                else
                    mission_file = String.Format(".\\{0:000}\\mission.lvl", i);
                if (File.Exists(mission_file))
                {
                    Console.WriteLine("Merging '{0}'...", mission_file);
                    form.AddonMissionFileName = mission_file;
                    form.MergeLevels();
                }
            }
            Console.WriteLine("Saving...");
            string outFile = form.SaveMissionFile();
            MessageBox.Show("New mission file saved to:\r\n" + Path.GetFullPath(outFile));
            form.Dispose();
        }
         */


        private static string sHelpMsg =
"MissionMerge.exe Version:" + version + "\n" +
@" This program merges SWBF2 missions from 2 files and saves the result for you.
 When merging from command line, '-base_mission' and -addon_missions' are required.
 The default output file is 'merged.mission.lvl' (so you don't accidentally overwrite 
  a 'mission.lvl' that you wanted [NOTE: You would need to rename it to 'mission.lvl'
 for the game to use it ])

 Examples:
  C:\> MissionMerge.exe -base_mission mission.lvl -addon_missions .\my_mission\mission.lvl 

  C:\> MissionMerge.exe -base_mission mission.lvl -addon_missions .\my_mission\mission.lvl -output .\done_mission\mission.lvl

  C:\> MissionMerge.exe -base_mission base.mission.lvl -search_path . -output ..\mission.lvl 

 Usage:
 Double click (no arguments) for GUI mode.
 Options:
   -base_mission   <file>  The mission.lvl file to merge into.
   -addon_missions <file>  The mission.lvl file to take missions from.
   -search_path    <path>  The path to search for files under.
   -output         <file>  The name of the output file (default is 'merged.mission.lvl')
   -h, /h, /? & --help     Print help message.";
    }
}
