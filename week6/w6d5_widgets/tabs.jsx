import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { title: "", content:"", index: 0 };
  }

  click(e) {
    e.preventDefault();
    const content = this.panes.content;
    this.setState({ content: content, title: "hello" });

  }

  render() {
    const panes = this.props.panes;

    return(
      <ul>
        {
          panes.map( (pane) =>
            <h1 onClick = {this.click} key={pane.title}>{pane.title}</h1>)
        }
      </ul>
    );

  }
}

export default Tabs;
