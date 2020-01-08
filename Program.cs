using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConsoleTools;

namespace ShellLauncherTester
{
    class Program
    {
        static void Main(string[] args)
        {
            var menu = new ConsoleMenu(args, level: 0)
              .Add("Return 0 - The operation completed successfully", () => Environment.Exit(0))
              .Add("Return 4 - The system cannot open the file", () => Environment.Exit(4))
              .Add("Return 8 - Not enough storage is available to process this command", () => Environment.Exit(8))
              .Add("Return 59 - An unexpected network error occurred", () => Environment.Exit(59))
              .Add("Return 1067 - The process terminated unexpectedly", () => Environment.Exit(1067))
              .Add("Return 13859 - Memory allocation failed", () => Environment.Exit(13859))
              .Configure(config =>
              {
                  config.Selector = "--> ";
                  config.Title = "Shell Launcher Tester";
                  config.EnableWriteTitle = true;
              });

            menu.Show();
        }
    }
}
