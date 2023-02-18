import styles from "./OwnerPaperContainer.module.css";

const OwnerPaperContainer = ({ onButtonContainerClick }) => {
  return (
    <div className={styles.headlineSubheadParent}>
      <div className={styles.headlineSubhead}>
        <div className={styles.nameOfPaper}>
          NAME of Paper given by owner....
        </div>
        <div className={styles.descriptionByOwner}>
          Description BY Owner......
        </div>
      </div>
      <div className={styles.subscribeForm}>
        <div className={styles.enterYourEmail}>Submit Query</div>
        <div className={styles.button} onClick={onButtonContainerClick}>
          <img className={styles.envelopesimpleIcon} alt="" />
          <div className={styles.button1}>BUY NOW</div>
        </div>
      </div>
    </div>
  );
};

export default OwnerPaperContainer;
