import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
    TextContainer: {
        backgroundColor: '#ffffff',
        flex: 1,
        alignItems: 'center',
        marginTop: 0,
        marginBottom: 0,
        justifyContent: 'center',
    },
    TextView: {
		flexDirection: 'row',
	},
    TextViewWithMargin: {
        flexDirection: 'row',
        marginBottom: 25
    },
    TextFormat: {
        marginTop: 10,
        fontSize: 20,
        fontFamily: 'Pacifico',
    },
    TextFormatWithMargin: {
		marginTop: 10,
		fontSize: 20,
		marginBottom: 25,
		fontFamily: 'Pacifico',
	},
    IconFormat: {
        marginTop: 12,
        marginLeft: 10,
        width: 35,
        height: 35,
    },
    IconFormatInstallation: {
		marginTop: 12,
		marginLeft: 10,
		width: 34,
		height: 34,
	},
    FullAccessText: {
        // marginTop: 5,
        fontSize: 13,
        fontFamily: 'Helvetica',
        paddingRight: 70,
        paddingLeft: 70, 
        textAlign: 'center'
    },
    FullAccessTextInstallation: {
		marginTop: 5,
		fontSize: 13,
		fontFamily: 'Helvetica',
		paddingRight: 70,
		paddingLeft: 70, 
		textAlign: 'center'
    },
    inputContainerStyle: {
        borderRadius: 20,
        borderWidth: 1,
        borderColor: 'grey',
        width: 255,
        height: 40,
        marginTop: 20,
        marginBottom: 140
    },
    inputStyle: {
        height: 40,
        fontSize: 15.5,
        // color: '#55b2f9',
        paddingLeft: 10,
        // fontFamily: 'Pacifico',
    }
});

export default styles;
