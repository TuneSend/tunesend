import React, { Component } from 'react';
import { View, Text, TextInput } from 'react-native';

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

const styles = {
    inputContainerStyle: {
        borderRadius: 20,
        borderWidth: 1,
        borderColor: 'grey',
        width: 280,
        height: 40,
        marginTop: 20,
        marginBottom: 140
    },
    inputStyle: {
        height: 40,
        fontSize: 18,
        // color: '#55b2f9',
        paddingLeft: 10,
        // fontFamily: 'Pacifico',
    }
}

export default KeyboardTest;
