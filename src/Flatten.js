import React, { useEffect, useState } from "react";

const people = [
  {
    name: "kumarmo2",
    location: {
      state: "Maharashtra",
      district: "thane",
      street: {
        name: "brahmand",
        code: "123",
        address: {
          flatNo: "dfsdf",
          buildingNo: "sddsf",
        },
      },
    },
  },
  {
    name: "gorgan",
    location: {
      state: "Jammu",
      district: "unknown",
      street: {
        name: "jammustreet",
        code: "12432",
        address: {
          flatNo: "g2",
          buildingNo: "b1",
        },
      },
    },
  },
];

//TODO: need to take care of any child of type array.
const flatten = (rootObj, rootObjectName) => {
  const flattenedObject = {};
  if (!rootObj) {
    return flattenedObject;
  }
  flattenRecursive(rootObj, rootObjectName, flattenedObject);
  return flattenedObject;
};

const flattenRecursive = (rootObj, rootObjectName, flattenedObject) => {
  if (!rootObj) {
    return;
  }

  Object.keys(rootObj).forEach((key) => {
    if (typeof rootObj[key] !== "object") {
      const newKeyName = `${rootObjectName}${key}`;
      flattenedObject[newKeyName] = rootObj[key];
    } else {
      const newRootObj = rootObj[key];
      const newRootObjectName = `${rootObjectName}${key}`;
      flattenRecursive(newRootObj, newRootObjectName, flattenedObject);
    }
  });
};

const Flatten = () => {
  const [flattenedList, setFlattenedList] = useState([]);
  useEffect(() => {
    const locations = people.map((pupil) => pupil.location);
    if (!locations.length) {
      return;
    }
    // const firstLocation = locations[0];
    // Object.keys(firstLocation).forEach((key) => {
    //   if (typeof firstLocation[key] !== "object") {
    //     console.log("unnested key: ", key);
    //   }
    // });

    const flattened = locations.map((location) => {
      return flatten(location, "");
    });
    setFlattenedList(flattened);
  }, []);

  return (
    <>
      <div>Flattened</div>
      {flattenedList.map((item, index) => {
        return (
          <div key={index}>
            {Object.keys(item).map((key, index) => {
              return (
                <React.Fragment key={index}>
                  <span>{key}</span> : <span>{item[key]}</span>
                  <br />
                </React.Fragment>
              );
            })}
            <br />
            <br />
            <br />
          </div>
        );
      })}
    </>
  );
};

export default Flatten;
