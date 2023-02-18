import styles from "./SubscribeWidget3.module.css";

const SubscribeWidget3 = () => {
  return (
    <div className={styles.subscribeWidget}>
      <div className={styles.photo} />
      <div className={styles.headlineSubheadWrapper}>
        <div className={styles.headlineSubhead}>
          <div className={styles.nameOfPaper}>
            NAME of Paper given by owner....
          </div>
          <div className={styles.descriptionByOwner}>
            Description BY Owner......
          </div>
        </div>
      </div>
    </div>
  );
};

export default SubscribeWidget3;
