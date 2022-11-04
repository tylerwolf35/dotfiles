import XMonad
import XMonad.Config.Xfce

main = xmonad xfceConfig
main = xmonad xfceConfig
            { modMask = mod4Mask }
	    
--myStartupHook = do
 -- spawn "xsetroot -cursor_name left_ptr"

--fixPanel :: IO ()
--fixPanel = void $ forkIO $ do
--  putStrLn "Delay starting"
--  threadDelay 5000000
--  putStrLn "Delay done"
--  putStr "Restarting xfce4-panel ... "
--  hFlush stdout
--  spawn "xfce4-panel -r"
--  putStrLn "[DONE]"