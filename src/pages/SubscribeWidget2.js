import PaperContainer from "../components/PaperContainer";
import styles from "./SubscribeWidget2.module.css";

const SubscribeWidget2 = () => {
  return (
    <div className={styles.subscribeWidget}>
      <div className={styles.photo} />
      <div className={styles.union}>
        <PaperContainer headlineSubheadTop="20px" />
        <PaperContainer headlineSubheadTop="117.32px" />
      </div>
    </div>
  );
};

export default SubscribeWidget2;
