// Licensed under the MIT license: https://opensource.org/licenses/MIT

using System.ComponentModel;
using System.Runtime.InteropServices;

namespace Whisper.net.LibraryLoader;

internal class WindowsLibraryLoader : ILibraryLoader
{
    private delegate IntPtr whisper_print_system_info_type();

    public LoadResult OpenLibrary(string filename)
    {
        var (module, info) = LoadLibraryWithInfo(filename);

        if (module == IntPtr.Zero)
        {
            var errorCode = Marshal.GetLastWin32Error();
            var errorMessage = new Win32Exception(errorCode).Message;
            return LoadResult.Failure(errorMessage);
        }

        if (info.ToLowerInvariant().Contains("avx2 = 1"))
        {
            return LoadResult.Success;
        }

        FreeLibrary(module);

        var avx1Filename = Path.Combine(Path.GetDirectoryName(filename) + "-avx1", Path.GetFileName(filename));
        (module, info) = LoadLibraryWithInfo(avx1Filename);

        if (module == IntPtr.Zero)
        {
            var errorCode = Marshal.GetLastWin32Error();
            var errorMessage = new Win32Exception(errorCode).Message;
            return LoadResult.Failure(errorMessage);
        }

        if (info.ToLowerInvariant().Contains("avx = 1"))
        {
            return LoadResult.Success;
        }

        FreeLibrary(module);

        var noavxFilename = Path.Combine(Path.GetDirectoryName(filename) + "-noavx", Path.GetFileName(filename));
        module = LoadLibrary(noavxFilename);

        if (module == IntPtr.Zero)
        {
            var errorCode = Marshal.GetLastWin32Error();
            var errorMessage = new Win32Exception(errorCode).Message;
            return LoadResult.Failure(errorMessage);
        }

        return LoadResult.Success;
    }


    private (IntPtr module, string info) LoadLibraryWithInfo(string filename)
    {
        if (LoadLibrary(filename) is var module && module == IntPtr.Zero)
        {
            return default;
        }

        var procAddr = GetProcAddress(module, "whisper_print_system_info");
        if (procAddr == IntPtr.Zero)
        {
            FreeLibrary(module);
            return default;
        }

        var whisper_print_system_info = (whisper_print_system_info_type)Marshal.GetDelegateForFunctionPointer(procAddr, typeof(whisper_print_system_info_type));
        var strInfo = Marshal.PtrToStringAnsi(whisper_print_system_info());

        return (module, strInfo);
    }

    [DllImport("kernel32", CharSet = CharSet.Ansi, ExactSpelling = true, SetLastError = true)]
    public static extern IntPtr GetProcAddress(IntPtr module, string proc);

    [DllImport("kernel32", SetLastError = true, CharSet = CharSet.Auto)]
    private static extern IntPtr LoadLibrary([MarshalAs(UnmanagedType.LPTStr)] string lpFileName);

    [DllImport("kernel32.dll", CharSet = CharSet.Unicode)]
    private static extern bool FreeLibrary(IntPtr hModule);

}
