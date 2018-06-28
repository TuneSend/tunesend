import React, { Component } from 'react';
import { View, Text, TextInput } from 'react-native';
import styles from '../stylesheets/styles';

// Component for input field to test TuneSend
class KeyboardTest extends Component {

    constructor(props) {
        super(props);

        // this.state = {}
    }

    render() {
        const {
            inputContainerStyle,
            inputStyle
        } = styles

        return (
            <View>
                <View style={inputContainerStyle}>
                    <TextInput
                        style={inputStyle}
                        placeholder={'Test TuneSend Keyboard Here!'}
                    />
                </View>
            </View>
        )
    }

}

export default KeyboardTest;
