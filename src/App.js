import {
  Routes,
  Route,
  useNavigationType,
  useLocation,
} from "react-router-dom";
import SubscribeWidget from "./pages/SubscribeWidget";
import SubscribeWidget1 from "./pages/SubscribeWidget1";
import SubscribeWidget2 from "./pages/SubscribeWidget2";
import SubscribeWidget3 from "./pages/SubscribeWidget3";
import SubscribeWidget4 from "./pages/SubscribeWidget4";
import SubscribeWidget5 from "./pages/SubscribeWidget5";
import FrameComponent from "./pages/FrameComponent";
import { useEffect } from "react";

function App() {
  const action = useNavigationType();
  const location = useLocation();
  const pathname = location.pathname;

  useEffect(() => {
    if (action !== "POP") {
      window.scrollTo(0, 0);
    }
  }, [action, pathname]);

  useEffect(() => {
    let title = "";
    let metaDescription = "";

    switch (pathname) {
      case "/":
        title = "";
        metaDescription = "";
        break;
      case "/subscribe-widget":
        title = "";
        metaDescription = "";
        break;
      case "/subscribe-widget1":
        title = "";
        metaDescription = "";
        break;
      case "/subscribe-widget2":
        title = "";
        metaDescription = "";
        break;
      case "/subscribe-widget3":
        title = "";
        metaDescription = "";
        break;
      case "/subscribe-widget4":
        title = "";
        metaDescription = "";
        break;
      case "/frame-231":
        title = "";
        metaDescription = "";
        break;
    }

    if (title) {
      document.title = title;
    }

    if (metaDescription) {
      const metaDescriptionTag = document.querySelector(
        'head > meta[name="description"]'
      );
      if (metaDescriptionTag) {
        metaDescriptionTag.content = metaDescription;
      }
    }
  }, [pathname]);

  return (
    <Routes>
      <Route path="/" element={<SubscribeWidget />} />

      <Route path="/subscribe-widget" element={<SubscribeWidget1 />} />

      <Route path="/subscribe-widget1" element={<SubscribeWidget2 />} />

      <Route path="/subscribe-widget2" element={<SubscribeWidget3 />} />

      <Route path="/subscribe-widget3" element={<SubscribeWidget4 />} />

      <Route path="/subscribe-widget4" element={<SubscribeWidget5 />} />

      <Route path="/frame-231" element={<FrameComponent />} />
    </Routes>
  );
}
export default App;
