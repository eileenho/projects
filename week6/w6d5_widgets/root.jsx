import React from 'react';

import Tabs from './tabs';

export default () => {
  // const tabsArray =
  const Panes = [
    {title: "one", content: "I am the first MONKEY"},
    {title: "two", content: "I am the second MONKEY"},
    {title: "three", content: "I am the three MONKEY"}
  ];

  return (
    <div>
      <Tabs panes={Panes} />
    </div>
  );
};
