import { useMemo } from "react";
import styles from "./PaperContainer.module.css";

const PaperContainer = ({ headlineSubheadTop }) => {
  const property1DefaultStyle = useMemo(() => {
    return {
      top: headlineSubheadTop,
    };
  }, [headlineSubheadTop]);

  return (
    <div className={styles.property1default} style={property1DefaultStyle}>
      <div className={styles.union}>
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
    </div>
  );
};

export default PaperContainer;
