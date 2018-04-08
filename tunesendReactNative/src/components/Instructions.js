import React, { Component } from 'react';
import { View, Text, Image } from 'react-native';

class Instructions extends Component {

    render() {
        const {
            TextContainer,
            textStyle,
            TextView,
            TextFormat,
            IconFormat,
            FullAccessText
        } = styles

        return (
            <View style={TextContainer}>
                <View
                    style={{
                        ...TextView,
                        borderBottomColor: 'rgba(0, 0, 0, 0.2)',
                        borderBottomWidth: 2,
                        marginBottom: 16,
                        marginTop: 60
                    }}
                >
                    <Text style={{
                        ...TextFormat,
                        fontSize: 28,
                        marginTop: 0,
                        marginBottom: 6
                    }}>
                    How To Use
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#55b2f9',
                            paddingLeft: 6,
                            fontSize: 29,
                            marginTop: 0,
                            marginBottom: 6
                        }}
                    >
                        Tune
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#f6be5f',
                            fontSize: 29,
                            paddingRight: 5,
                            marginTop: 0,
                            marginBottom: 6
                        }}
                    >
                        Send
                    </Text>
                </View>
                <View style={TextView}>
                        <Text
                            style={{
                                ...TextFormat,
                                // paddingRight: 3,
                                paddingLeft: 12
                            }}
                    >
                        Switch to
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#55b2f9',
                            paddingLeft: 6
                        }}
                    >
                        Tune
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#f6be5f',
                            paddingRight: 5
                        }}
                    >
                        Send
                    </Text>
                    <Image
                        style={{
                            ...IconFormat,
                            width: 25,
                            height: 25,
                            marginTop: 18,
                            marginLeft: 5,
                        }}
                        source={require('../image/globeKey3.png')}
                    />
                </View>
                <View style={TextView}>
                        <Text style={{
                            ...TextFormat,
                            // paddingRight: 3,
                            paddingLeft: 12
                        }}
                    >
                        Type your
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#55b2f9',
                            paddingLeft: 6
                        }}
                    >
                        Mes
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#f6be5f',
                            paddingRight: 5
                        }}
                    >
                        sage
                    </Text>
                    <Image
                        style={{
                            ...IconFormat,
                            // flex: 1,
                            resizeMode: 'contain',
                            width: 70,
                            marginTop: 16,
                            marginBottom: 15,
                            marginLeft: 5,
                        }}
                        source={require('../image/TuneSendKeyboard.png')}
                    />
                </View>
                <View style={{ ...TextView, marginBottom: 0 }}>
                        <Text
                            style={{
                                ...TextFormat,
                                // paddingRight: 3,
                                paddingLeft: 12
                            }}
                    >
                        Press the
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#55b2f9',
                            paddingLeft: 6
                        }}
                    >
                        Play
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#f6be5f',
                            paddingLeft: 5
                        }}
                    >
                        Button
                    </Text>
                    <Image
                        style={{
                            ...IconFormat,
                            resizeMode: 'contain',
                            width: 50,
                            marginTop: 14,
                            marginBottom: 15,
                            marginLeft: 9,
                        }}
                        source={require('../image/playButtonDisplay.png')}
                    />
                </View>
                <View style={TextView}>
                    <Text style={FullAccessText}>
                        When the Play Button is pressed, 
                        TuneSend plays back your message
                        and creates a musical recording of it.
                    </Text>
                </View>
                <View style={TextView}>
                        <Text style={{
                            ...TextFormat,
                            // paddingRight: 3,
                            paddingLeft: 12
                        }}
                    >
                        Paste the
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#55b2f9',
                            paddingLeft: 6
                        }}
                    >
                        Recor
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#f6be5f',
                            paddingRight: 5
                        }}
                    >
                        ding
                    </Text>
                    <Image
                        style={{
                            ...IconFormat,
                            // flex: 1,
                            resizeMode: 'contain',
                            width: 100,
                            marginTop: 16,
                            marginBottom: 15,
                            marginLeft: 5,
                        }}
                        source={require('../image/pasteRecording.png')}
                    />
                </View>
                <View style={TextView}>
                        <Text style={{
                            ...TextFormat,
                            // paddingRight: 3,
                            paddingLeft: 12
                        }}
                    >
                        Press
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#55b2f9',
                            paddingLeft: 6
                        }}
                    >
                        Se
                    </Text>
                    <Text
                        style={{
                            ...TextFormat,
                            color: '#f6be5f',
                            paddingRight: 5
                        }}
                    >
                        nd
                    </Text>
                    <Image
                        style={{
                            ...IconFormat,
                            // flex: 1,
                            resizeMode: 'contain',
                            width: 86,
                            marginTop: 16,
                            marginBottom: 15,
                            marginLeft: 0,
                        }}
                        source={require('../image/sendRecording.png')}
                    />
                </View>
            </View>
        );
    }
}

const styles = {
    TextContainer: {
		backgroundColor: '#ffffff',
		flex: 1,
		alignItems: 'center',
		marginTop: 0,
		marginBottom: 0,
		justifyContent: 'center',
	},
    textStyle: {
        marginBottom: 50,
        fontFamily: 'Pacifico',
        fontSize: 30
    },
    TextView: {
        flexDirection: 'row',
        marginBottom: 25
	},
	TextFormat: {
		marginTop: 10,
		fontSize: 24,
		fontFamily: 'Pacifico',
    },
    IconFormat: {
		marginTop: 12,
		marginLeft: 10,
		width: 40,
		height: 40,
    },
    FullAccessText: {
        // marginTop: 5,
		fontSize: 15,
		fontFamily: 'Helvetica',
		paddingRight: 70,
		paddingLeft: 70, 
		textAlign: 'center'
	}
};

export default Instructions;
